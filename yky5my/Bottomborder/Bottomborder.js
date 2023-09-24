/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Bottomborder extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("bottomLine", "./Bottomborder/costumes/bottomLine.svg", {
        x: 326.0105105105106,
        y: -179.08719179658436
      })
    ];

    this.sounds = [new Sound("pop", "./Bottomborder/sounds/pop.wav")];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenGreenFlagClicked() {
    this.visible = true;
  }
}
