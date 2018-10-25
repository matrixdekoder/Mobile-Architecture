import { observable, action } from 'mobx'

export default class DemoStore {

  @observable count = 0;

  @action increase = () => {
    this.count += 1
  }

}