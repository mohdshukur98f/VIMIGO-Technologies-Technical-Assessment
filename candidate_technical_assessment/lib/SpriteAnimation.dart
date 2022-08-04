import 'package:flame/components.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame {
  SpriteAnimationComponent vimigoAnimation = SpriteAnimationComponent();

  @override
  Future<void> onLoad() async {
    var spriteSheet = await images.load('animation.png');
    final spritesize = Vector2(80, 80);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
        amount: 35,
        amountPerRow: 12,
        stepTime: 0.3,
        textureSize: Vector2(170, 170));

    vimigoAnimation =
        SpriteAnimationComponent.fromFrameData(spriteSheet, spriteData)
          ..x = 260
          ..y = 600
          ..size = spritesize;

    add(vimigoAnimation);
  }
}
