import {action, observable} from "mobx";

export default class AppStoreProvider {

  constructor(demoRepository) {
    this.demoRepository = demoRepository
  }

  @observable count = 0;

  @action increase = () => {
    this.count += 1
  }
}