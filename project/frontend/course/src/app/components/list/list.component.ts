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
  courses: Course[];
  currentDepartmentId: number;
  searchMode: boolean;
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
    this.courseService.getCourseList(this.currentDepartmentId).subscribe(
    data=>{
    this.courses = data;
    }
    );
  }

}
