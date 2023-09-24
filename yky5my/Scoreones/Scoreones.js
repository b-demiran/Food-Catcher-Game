/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Scoreones extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("0", "./Scoreones/costumes/0.svg", {
        x: 204.66689852094794,
        y: 140.61029427970146
      }),
      new Costume("1", "./Scoreones/costumes/1.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("2", "./Scoreones/costumes/2.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("3", "./Scoreones/costumes/3.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("4", "./Scoreones/costumes/4.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("5", "./Scoreones/costumes/5.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("6", "./Scoreones/costumes/6.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("7", "./Scoreones/costumes/7.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("8", "./Scoreones/costumes/8.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("9", "./Scoreones/costumes/9.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      })
    ];

    this.sounds = [new Sound("pop", "./Scoreones/sounds/pop.wav")];

    this.triggers = [
      new Trigger(
        Trigger.BROADCAST,
        { name: "score++" },
        this.whenIReceiveScore
      ),
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked)
    ];
  }

  *whenIReceiveScore() {
    if (this.toNumber(this.stage.vars.score) % 10 === 0) {
      this.costume = 0;
    } else {
      this.costumeNumber++;
    }
  }

  *whenGreenFlagClicked() {
    this.visible = false;
    this.stage.vars.score = 0;
    this.costume = 0;
  }

  *whenbackdropswitchesto() {
    this.visible = true;
  }
}
