import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { ListComponent } from './components/list/list.component';
import { AddComponent } from './components/add/add.component';
import { Routes, RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { CourseService } from './services/course.service';
import { SearchComponent } from './components/search/search.component';
import { CourseDetailComponent } from './components/course-detail/course-detail.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

const routes: Routes = [
  {path: 'courses/:id', component: CourseDetailComponent},
  {path: 'search/:keyword', component: ListComponent},
  {path: 'department/:id', component:ListComponent},
  {path: 'department', component:ListComponent},
  {path: 'courses', component:ListComponent},
  {path:'list', component:ListComponent},
  {path:'add', component:AddComponent},
  {path: '', redirectTo: '/courses', pathMatch: 'full'},
  {path: '**', redirectTo: '/courses', pathMatch: 'full'}
];

@NgModule({
  declarations: [
    AppComponent,
    ListComponent,
    AddComponent,
    SearchComponent,
    CourseDetailComponent
  ],
  imports: [
    RouterModule.forRoot(routes),
    BrowserModule,
    HttpClientModule,
    NgbModule
  ],
  providers: [CourseService],
  bootstrap: [AppComponent]
})
export class AppModule { }
