import { LightningElement } from 'lwc';
import HomeFlowersLogo from "@salesforce/resourceUrl/HomeFlowers";
import notification from "@salesforce/resourceUrl/notification";
import search from "@salesforce/resourceUrl/search";
export default class Flowerheader extends LightningElement {
  queryTerm;
  HomeFlowersUrl = HomeFlowersLogo;
  notificationIcon = notification;
  searchIcon = search;
  currentTime = new Date();

  handleKeyUp(evt) {
    const isEnterKey = evt.keyCode === 13;
    if (isEnterKey) {
      this.queryTerm = evt.target.value;
    }
  }
}