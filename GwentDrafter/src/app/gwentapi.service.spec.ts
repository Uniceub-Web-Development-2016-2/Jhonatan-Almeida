import { TestBed, inject } from '@angular/core/testing';

import { GwentapiService } from './gwentapi.service';

describe('GwentapiService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [GwentapiService]
    });
  });

  it('should be created', inject([GwentapiService], (service: GwentapiService) => {
    expect(service).toBeTruthy();
  }));
});
