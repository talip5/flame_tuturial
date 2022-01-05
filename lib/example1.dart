import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutter/rendering.dart';

class AsepriteExample extends FlameGame {
  static const String description = '''
    This example shows how to load animations from a asprite json file and a
    sprite sheet. There is no interaction on this example.
  ''';

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final image = await images.load('animations/chopper.png');
    final jsonData = await assets.readJson('images/animations/chopper.json');
    final animation = SpriteAnimation.fromAsepriteData(image, jsonData);
    final spriteSize = Vector2.all(200);
    final animationComponent = SpriteAnimationComponent(
      animation: animation,
      position: (size - spriteSize) / 2,
      size: spriteSize,
    );
    add(animationComponent);
  }
}

/*class MyGame extends FlameGame with TapDetector{

  @override
  void onTapDown(TapDownInfo info) {
    debugPrint('clicked!');
    super.onTapDown(info);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    //add(MyCrate());

  }
}*/
main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  Flame.device.setLandscape();
  final myGame= AsepriteExample();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}