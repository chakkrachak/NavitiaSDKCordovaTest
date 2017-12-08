import { Component, NgZone } from '@angular/core';
import { NavController } from 'ionic-angular';

declare var NavitiaSDK: any;

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
    items;

    constructor(public navCtrl: NavController, private zone: NgZone) {
        this.items = [];
    }

    getItems(ev) {
        this.items = [];

        // set val to the value of the ev target
        var val = ev.target.value;

        var that = this;
        NavitiaSDK.init('9e304161-bb97-4210-b13d-c71eaf58961c');
      	NavitiaSDK.places.placesRequestBuilder().withQ(val).get(
            function (success) {
                that.zone.run(function () {
                    for (var item of success.places) {
                        that.items.push(item.name);
                    }
                })
            }, function (error) {
                alert(error);
            });
    }
}

