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
  getCourse(courseId:number): Observable<Course> {
    const courseURL = `${this.baseUrl}/${courseId}`;
    return this.httpClient.get<Course>(courseURL);
  }
  /*
  getCourseList(departmentId:number): Observable<Course[]> {
    const searchUrl = `${this.baseUrl}/search/findByDepartmentId?id=${departmentId}`;

    return this.httpClient.get<GetResponse>(searchUrl).pipe(
      map(response => response._embedded.courses)
  );
  }
  */
  getCourseListPaginate(
    thePage: number,
    thePageSize: number,
    theDepartmentId: number): Observable<GetResponseCourses> {
    // http://localhost:8080/api/products/search/findByCategoryId?id=1&page=0&size=10
        const url = `${this.baseUrl}/search/findByDepartmentId`
        + `?id=${theDepartmentId}&page=${thePage}&size=${thePageSize}`;

        return this.httpClient.get<GetResponseCourses>(url);
    }
  searchCourses(theKeyword: string): Observable<Course[]> {
    const searchUrl = `${this.baseUrl}/search/findByNameContaining?title=${theKeyword}`;
    return this.httpClient.get<GetResponseCourses>(searchUrl).pipe(
          map(response => response._embedded.courses));
   }
  }
interface GetResponseCourses {
  _embedded: { courses: Course[];  },
  page: {
        size: number,
        totalElements: number,
        totalPages: number,
        number: number
  }
}
