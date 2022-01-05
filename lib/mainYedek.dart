import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';



class MyCrate extends SpriteComponent {
  // creates a component that renders the crate.png sprite, with size 16 x 16
  MyCrate() : super(size: Vector2.all(116));

  Future<void> onLoad() async {
    sprite = await Sprite.load('crate.png');
    anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    // We don't need to set the position in the constructor, we can set it directly here since it will
    // be called once before the first time it is rendered.
    position = gameSize / 2;
  }
}import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';



class MyCrate extends SpriteComponent {
  // creates a component that renders the crate.png sprite, with size 16 x 16
  MyCrate() : super(size: Vector2.all(100.0));

  Future<void> onLoad() async {
    sprite = await Sprite.load('crate.png');
    anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    // We don't need to set the position in the constructor, we can set it directly here since it will
    // be called once before the first time it is rendered.
    //position = gameSize / 4;
    position=gameSize/10;
    //sprite.srcSize=gameSize/4;
    //sprite.srcSize.y=200;
    print('');
  }
}

class MyDino extends SpriteComponent {
  // creates a component that renders the crate.png sprite, with size 16 x 16
  MyDino() : super(size: Vector2.all(100.0));

  Future<void> onLoad() async {
    sprite=await Sprite.load("DinoSprites_mort.gif");
    anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    // We don't need to set the position in the constructor, we can set it directly here since it will
    // be called once before the first time it is rendered.
    //position = gameSize / 4;
    position=gameSize/3;
    //sprite.srcSize=gameSize/4;
    //sprite.srcSize.y=200;
  }
}

class MyGame extends FlameGame with TapDetector{

  @override
  void onTapDown(TapDownInfo info) {
    debugPrint('clicked!');
    super.onTapDown(info);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(MyCrate());
    add(MyDino());
  }
}

main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  Flame.device.setLandscape();
  final myGame= MyGame();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}

class MyGame extends FlameGame with TapDetector{

  @override
  void onTapDown(TapDownInfo info) {
 debugPrint('clicked!');
    super.onTapDown(info);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(MyCrate());
  }
}

main() {
  final myGame = MyGame();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}