/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Icons extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("Icons", "./Icons/costumes/Icons.svg", {
        x: 120.94144,
        y: 44.99099000000001
      })
    ];

    this.sounds = [];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenbackdropswitchesto() {
    this.visible = true;
  }

  *whenGreenFlagClicked() {
    this.visible = false;
  }

  *whenbackdropswitchesto2() {
    this.visible = false;
  }
}
