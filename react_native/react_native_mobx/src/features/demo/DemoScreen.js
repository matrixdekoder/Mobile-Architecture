import React, {Component} from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  Button,
  View
} from 'react-native';
import {observer} from "mobx-react/native";
import DemoStore from "./DemoStore"
import Routes from "../../statics/Routes"

@observer
export default class DemoScreen extends Component {

  constructor(props) {
    super(props);
  }

  render() {
    let appStoreProvider = this.props.appStoreProvider;
    let demoStore = this.props.demoStore;
    return (
      <View>
        <Text>{appStoreProvider.count}</Text>
        <Button
          onPress={appStoreProvider.increase}
          title={"Increase"}
        />

        <Text>{demoStore.count}</Text>
        <Button
          onPress={demoStore.increase}
          title={"Increase"}
        />

        <Button
          onPress={() => {
            this.props.navigation.navigate(Routes.Demo)
          }}
          title={"Next"}
        />
      </View>
    )
  }
}