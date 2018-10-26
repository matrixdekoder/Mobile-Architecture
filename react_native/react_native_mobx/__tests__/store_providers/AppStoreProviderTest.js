import DemoRepository from "../../src/data/repositories/DemoRepository";
import AppStoreProvider from "../../src/providers/AppStoreProvider";

test('AppStoreProvider', () => {
  let appStoreProvider = new AppStoreProvider(new DemoRepository());
  expect(appStoreProvider.count).toBe(0);

  appStoreProvider.increase();
  expect(appStoreProvider.count).toBe(1);
});