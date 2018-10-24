import {createStackNavigator} from "react-navigation";
import DemoScreen from "../../features/demo/DemoScreen";


const AppNavigator = createStackNavigator(
  {
    Initial: DemoScreen,
    Demo: DemoScreen
  },
  {
    initialRouteName: 'Initial',
    headerMode: 'none'
  }
);

export default AppNavigator;