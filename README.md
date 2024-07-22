# Entry projekt - Seznam Flutter Vývojář

## Setup

### FVM
This project uses FVM (Flutter Version Manager). It is recommended to install FVM instructions [here](https://fvm.app/documentation/getting-started/installation). It is also possible to use local installation of Flutter.

### Build Runner
This project uses build runner so before launching the app please run the following command to generate all the required files. They are committed to git as well but just in case regenerate them.

```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

## Project Description

Project uses Placeholder API as required by the assignment. The project uses [Riverpod](https://pub.dev/packages/flutter_riverpod) as recommended by the assignment. 
Furthermore the project uses [Freezed](https://pub.dev/packages/freezed) and [Json_Serializable](https://pub.dev/packages/json_serializable) to generate immutable objects with json serialization.
There is also local storage of comments using [Hive](https://pub.dev/packages/hive) as recommended.
Additionally there is implemented form validation using the built-in [Form](https://api.flutter.dev/flutter/widgets/Form-class.html) widget.
There are also some animations done using [Flutter_Staggered_Animations](https://pub.dev/packages/flutter_staggered_animations).
Routing is accomplished using [GoRouter](https://pub.dev/packages/go_router).

## Git usage
There is a very limited git usage. Only one commit that contains everything because I noticed just at the end that I am supposed to create a repository and use it :D .

## Additional notes
- Enjoyed the project I wanted to try Riverpod for some time. Usually I use [Bloc](https://bloclibrary.dev/).
- The placeholder api returns slightly different data types on different endpoints for the same entities. E.g. GET /posts/1/comments returns comments with postId as integer while POST /posts/1/comments returns the newly created comment with postId as string. Just a random weird thing I noticed during implementation.