/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Startbutton extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("startButton", "./Startbutton/costumes/startButton.png", {
        x: 351,
        y: -186
      })
    ];

    this.sounds = [];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenbackdropswitchesto() {
    this.visible = false;
  }

  *whenGreenFlagClicked() {
    this.visible = true;
  }

  *whenbackdropswitchesto2() {
    this.visible = false;
  }
}
