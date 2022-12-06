import { Component, OnInit } from '@angular/core';
import { CourseService } from 'src/app/services/course.service';
import { Course } from 'src/app/common/course';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-course-detail',
  templateUrl: './course-detail.component.html',
  styleUrls: ['./course-detail.component.css']
})
export class CourseDetailComponent implements OnInit {
  course: Course = new Course();
  constructor(private courseService: CourseService, private route: ActivatedRoute) { }

    ngOnInit(): void {
      this.route.paramMap.subscribe(
        () => { this.getCourseDetail(); }
      );
    }

    getCourseDetail() {
        // get the id value in string and convert it to a number
        // “+” convert the string value to a number
        // get()! tells the compiler that the returned value of the get() is not null
        const currentCourseId: number = +this.route.snapshot.paramMap.get('id')!;

  // get product for current product id, getProduct() is defined in product service
    this.courseService.getCourse(currentCourseId).subscribe(
        data => { this.course = data; }
    );
   }
}
