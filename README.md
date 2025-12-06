# TemplateAppMobile

Ce dépôt contient une application Compose Multiplatform prête pour Android et iOS, inspirée du modèle "TemplateAppMobile". La base de code est organisée en deux modules :

- `shared` : module Kotlin Multiplatform qui héberge l'UI Compose commune et s'expose à iOS via CocoaPods.
- `androidApp` : module Android qui démarre l'interface partagée à l'aide de `MainActivity`.

## Prérequis
- JDK 17
- Android Studio Iguana/Koala ou plus récent avec le plugin Compose Multiplatform
- Xcode 14.1+ et CocoaPods pour la cible iOS

## Construction
### Android
```bash
./gradlew :androidApp:assembleDebug
```

### iOS
Depuis le dossier `iosApp`, installez les pods puis ouvrez le workspace généré :
```bash
cd iosApp
pod install
open iosApp.xcworkspace
```
Lancez ensuite l'app sur un simulateur ou un appareil.
