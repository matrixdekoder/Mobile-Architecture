import DemoRepository from "./data/repositories/DemoRepository";
import AppStoreProvider from "./providers/AppStoreProvider";


class Injector {

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
injector.demoRepository = new DemoRepository();
injector.appStoreProvider = new AppStoreProvider(injector.demoRepository);

export default injector;