import {action, observable} from "mobx";

export default class AppStoreProvider {

  @observable count = 0;

  @action increase = () => {
    this.count += 1
  }
}