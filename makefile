all : clean restore build publish

clean:
	flutter clean

install:
	flutter pub get

build: 
	flutter run

run:
	flutter run

freeze:
	flutter pub run build_runner build --delete-conflicting-outputs

run-release:
	flutter run --release -v

run-android:
	flutter run -d all

open-runner:
	open ios/Runner.xcworkspace

pod-install:
	cd ios && pod install


i18n:
	flutter gen-l10n

openapi:
	openapi-generator generate \
  -i https://api.sizin-sunucu.com/swagger/v1/swagger.json \
  -g dart-dio \
  -o lib/api \
  --additional-properties=pubName=api_client,dartNullSafety=true

openapi_repeat:
rm -rf lib/api
openapi-generator generate \
  -i openapi.json \
  -g dart-dio \
  -o lib/api \
  --additional-properties=pubName=api_client,dartNullSafety=true

