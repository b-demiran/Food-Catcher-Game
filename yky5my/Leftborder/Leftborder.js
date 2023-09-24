/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Leftborder extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("leftLine", "./Leftborder/costumes/leftLine.svg", {
        x: 202.55855584025667,
        y: -41.26523991371673
      })
    ];

    this.sounds = [new Sound("pop", "./Leftborder/sounds/pop.wav")];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenGreenFlagClicked() {
    this.visible = true;
  }
}
