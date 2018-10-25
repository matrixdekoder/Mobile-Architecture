import { observable, action } from 'mobx'

export default class DemoStore {


  constructor(demoRepository) {
    this.demoRepository = demoRepository
  }

  @observable count = 0;

  @action increase = () => {
    this.count += 1
  }

}