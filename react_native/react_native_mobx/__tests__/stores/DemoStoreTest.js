import DemoStore from "../../src/features/demo/DemoStore";
import DemoRepository from "../../src/data/repositories/DemoRepository";


test('DemoStore', () => {
  let demoStore = new DemoStore(new DemoRepository());
  expect(demoStore.count).toBe(0);

  demoStore.increase();
  expect(demoStore.count).toBe(1);
});