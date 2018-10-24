/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';
import AppNavigator from "./components/navigator/app-navigator";

type Props = {};
export default class App extends Component<Props> {
  render() {
    return <AppNavigator/>
    // return (
    //   <View style={styles.container}>
    //     <Text style={styles.welcome}>
    //       Welcome to React Native!
    //     </Text>
    //     <Text style={styles.instructions}>
    //       To get started, edit App.js
    //     </Text>
    //     <Text style={styles.instructions}>
    //       {instructions}
    //     </Text>
    //   </View>
    // );
  }
}