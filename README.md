# RealmExample

`CocoaPods(0.38.0)`でRealmに依存しているライブラリをdependencyに指定する場合のpodspecの書き方を調査。

---

依存関係は`RealmExample` -> `YSRealmStore` -> `Realm`となっている。

[RealmExample.podspec](https://github.com/yusuga/RealmExample/blob/master/RealmExample.podspec)

	  s.dependency 'YSRealmStore'

[YSRealmStore.podspec](https://github.com/yusuga/YSRealmStore/blob/master/YSRealmStore.podspec)

	  s.dependency 'Realm', '0.93.2'

---

上記の状態でRealmExampleを`pod lib lint`すると下記のエラー

```
warning: embedded dylibs/frameworks only run on iOS 8 or later
Undefined symbols for architecture x86_64:
  "_OBJC_CLASS_$_RLMObject", referenced from:
      _OBJC_CLASS_$_Model in Model.o
  "_OBJC_METACLASS_$_RLMObject", referenced from:
      _OBJC_METACLASS_$_Model in Model.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)

** BUILD FAILED **


The following build commands failed:
	Ld /var/folders/b_/j8xn4tvx1xs06s9pcr2142yr0000gn/T/CocoaPods/Lint/build/Pods.build/Release-iphonesimulator/RealmExample.build/Objects-normal/x86_64/RealmExample normal x86_64
(1 failure)
 -> RealmExample (0.0.1)
    - ERROR | [iOS] Returned an unsuccessful exit code.
    - NOTE  | [iOS]  clang: error: linker command failed with exit code 1 (use -v to see invocation)
```
	
---

## ひとまずの回避方法

[RealmExample.podspec](https://github.com/yusuga/RealmExample/blob/master/RealmExample.podspec)に`dependency 'Realm'`を追加

	s.dependency 'YSRealmStore'
	s.dependency 'Realm'
	
---

## 調査中

[RealmExample.podspec](https://github.com/yusuga/RealmExample/blob/master/RealmExample.podspec)に`dependency 'Realm'`を追加せずに`pod lib lint`が通る方法。

## 解決

`--use-libraries`を付ける。

参考: [pod lib lint](https://guides.cocoapods.org/terminal/commands.html#pod_lib_lint), [pod repo push](https://guides.cocoapods.org/terminal/commands.html#pod_repo_push)