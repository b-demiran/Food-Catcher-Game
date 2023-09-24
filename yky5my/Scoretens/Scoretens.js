/* eslint-disable require-yield, eqeqeq */

import {
  Sprite,
  Trigger,
  Watcher,
  Costume,
  Color,
  Sound
} from "https://unpkg.com/leopard@^1/dist/index.esm.js";

export default class Scoretens extends Sprite {
  constructor(...args) {
    super(...args);

    this.costumes = [
      new Costume("0", "./Scoretens/costumes/0.svg", {
        x: 204.66689852094794,
        y: 140.61029427970146
      }),
      new Costume("1", "./Scoretens/costumes/1.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("2", "./Scoretens/costumes/2.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("3", "./Scoretens/costumes/3.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("4", "./Scoretens/costumes/4.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("5", "./Scoretens/costumes/5.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("6", "./Scoretens/costumes/6.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("7", "./Scoretens/costumes/7.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("8", "./Scoretens/costumes/8.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      }),
      new Costume("9", "./Scoretens/costumes/9.svg", {
        x: 204.66689374999999,
        y: 140.610236875
      })
    ];

    this.sounds = [new Sound("pop", "./Scoretens/sounds/pop.wav")];

    this.triggers = [
      new Trigger(Trigger.GREEN_FLAG, this.whenGreenFlagClicked),
      new Trigger(
        Trigger.BROADCAST,
        { name: "score++" },
        this.whenIReceiveScore
      )
    ];
  }

  *whenGreenFlagClicked() {
    this.visible = false;
    this.stage.vars.score = 0;
    this.costume = 0;
  }

  *whenIReceiveScore() {
    if (this.toNumber(this.stage.vars.score) % 100 === 0) {
      this.costume = 0;
    } else {
      if (this.toNumber(this.stage.vars.score) % 10 === 0) {
        this.visible = true;
        this.costumeNumber++;
      }
    }
  }
}
