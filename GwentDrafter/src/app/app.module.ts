import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
/*import { HttpClientInMemoryWebApiModule } from 'angular-in-memory-web-api';
import { InMemoryDataService }  from './in-memory-data.service';*/
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SelectComponent } from './select/select.component';
import { DeckComponent } from './deck/deck.component';

@NgModule({
  declarations: [
  AppComponent,
  SelectComponent,
  DeckComponent
  ],
  imports: [
  BrowserModule,
  AppRoutingModule,
  FormsModule,
  ],
  providers: [],
  bootstrap: [
  AppComponent,
  SelectComponent,
  DeckComponent
  ]
})
export class AppModule { }
