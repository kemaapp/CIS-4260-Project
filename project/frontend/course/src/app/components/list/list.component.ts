import { Component, OnInit } from '@angular/core';
import { CourseService } from '../../services/course.service';
import { Course } from '../../common/course';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {
  courses: Course[] = [];
  currentDepartmentId: number = 1;
  previousDepartmentId: number = 1;
  searchMode: boolean = false;
    thePageNumber: number = 1; // page number in ng-bootstrap is 1 based: starting from 1 not 0
    thePageSize: number = 15;
    theTotalElements: number = 0;
  constructor(private courseService: CourseService, private route: ActivatedRoute) { }
  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.listCourses();
    });
  }
  listCourses() {
    this.searchMode = this.route.snapshot.paramMap.has('keyword');
    if (this.searchMode) {
          this.handleSearchCourses();
    }
    else {  // not search
          this.handleListCourses();
    }
  }
  handleSearchCourses() {
    const term: string = this.route.snapshot.paramMap.get('keyword')!;
    this.courseService.searchCourses(term).subscribe(
          data => { this.courses = data; }
    );
  }
  handleListCourses() {
    const hasDepartmentId: boolean = this.route.snapshot.paramMap.has('id');
    if (hasDepartmentId) {
      this.currentDepartmentId = +this.route.snapshot.paramMap.get('id')!;
    }
    else {
      this.currentDepartmentId = 1;
    }
    if (this.previousDepartmentId != this.currentDepartmentId) {
          this.thePageNumber = 1;
    }

    this.previousDepartmentId = this.currentDepartmentId;

    // get courses for the given Department id
    this.courseService.getCourseListPaginate(
      this.thePageNumber - 1,
          this.thePageSize,
          this.currentDepartmentId).subscribe(this.processResult());
    /*
    this.courseService.getCourseList(this.currentDepartmentId).subscribe(
          data => {
            this.courses = data;
          }
    );
    */
    }
    private processResult() {
          return (data: any) => {
            this.courses = data._embedded.courses;
            this.thePageNumber = data.page.number + 1;
            this.thePageSize = data.page.size;
            this.theTotalElements = data.page.totalElements;
          };
    }
    updatePageSize(value: number) {
          this.thePageSize = value;
          this.thePageNumber = 1;
          this.handleListCourses(); // redisplay courses
    }
}
