import {createStackNavigator} from "react-navigation";
import DemoScreen from "../../features/demo/DemoScreen";
import injector from "../../Injector";
import React from "react";
import DemoStore from "../../features/demo/DemoStore";

const AppNavigator = createStackNavigator(
  {
    Initial: {
      screen: (props) => <DemoScreen
        {...props}
        appStoreProvider={injector.appStoreProvider}
        demoStore={new DemoStore(injector.demoRepository)}
      />,
    },
    Demo: {
      screen: (props) => <DemoScreen
        {...props}
        appStoreProvider={injector.appStoreProvider}
        demoStore={new DemoStore(injector.demoRepository)}
      />,
    }
  },
  {
    initialRouteName: 'Initial',
    headerMode: 'none'
  }
);

export default AppNavigator;