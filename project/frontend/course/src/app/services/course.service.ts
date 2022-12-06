import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'; // HttpClient performs HTTP requests
import { Course } from '../common/course';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class CourseService {
  private baseUrl = 'http://localhost:8090/courses';
  constructor(private httpClient: HttpClient) {}
  getCourseList(departmentId:number): Observable<Course[]> {
    const searchUrl = `${this.baseUrl}/search/findByDepartmentId?id=${departmentId}`;

    return this.httpClient.get<GetResponse>(searchUrl).pipe(
      map(response => response._embedded.courses)
  );
  }
  searchCourses(theKeyword: string): Observable<Course[]> {
    const searchUrl = `${this.baseUrl}/search/findByNameContaining?name=${theKeyword}`;
    return this.httpClient.get<GetResponse>(searchUrl).pipe(
          map(response => response._embedded.courses));
   }
  }
interface GetResponse {
  _embedded: { courses: Course[];  }
}
