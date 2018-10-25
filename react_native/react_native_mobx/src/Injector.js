import DemoRepository from "./data/repositories/DemoRepository";
import AppStoreProvider from "./providers/AppStoreProvider";


class Injector {



  // constructor(appStoreProvider) {
  //   this._appStoreProvider = appStoreProvider;
  // }

  get appStoreProvider() {
    return this._appStoreProvider;
  }

  set appStoreProvider(value) {
    this._appStoreProvider = value;
  }

  get demoRepository() {
    return this._demoRepository;
  }

  set demoRepository(value) {
    this._demoRepository = value;
  }
}

const injector = new Injector();
injector.appStoreProvider = new AppStoreProvider();
injector.demoRepository = new DemoRepository();

export default injector;