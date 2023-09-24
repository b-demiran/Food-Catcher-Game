/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Rightborder extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("rightLine", "./Rightborder/costumes/rightLine.svg", {
        x: -227.8629933333333,
        y: -21.73970376876892
      })
    ];

    this.sounds = [new Sound("pop", "./Rightborder/sounds/pop.wav")];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenGreenFlagClicked() {
    this.visible = true;
  }
}
