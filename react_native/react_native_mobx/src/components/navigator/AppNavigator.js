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
        demoRepository={injector.demoRepository}
        demoStore={new DemoStore()}
      />,
    },
    Demo: {
      screen: (props) => <DemoScreen
        {...props}
        appStoreProvider={injector.appStoreProvider}
        demoRepository={injector.demoRepository}
        demoStore={new DemoStore()}
      />,
    }
  },
  {
    initialRouteName: 'Initial',
    headerMode: 'none'
  }
);

export default AppNavigator;