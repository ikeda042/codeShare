## 課題一覧

- [交通量を集計せよ DOM編](<./交通量を集計せよ DOM編/main.js>)
- [(任意) エラトステネスの篩を実装せよ DOM編](<./ (任意) エラトステネスの篩を実装せよ DOM編/main.js>)
- [(任意) ハッシュ値生成ツール](<./(任意) ハッシュ値生成ツール/api.js>)
- [(任意) 試験結果を通知せよ JavaScript編](<./(任意) 試験結果を通知せよ JavaScript編/main.js>)


## javascriptの基本コード

```javascript
// 配列操作
const arr1 = [1,2,3,4,5];
// 最初の要素
console.log(arr1[0]);
// 最後の要素
console.log(arr1[arr1.length-1]);


const arr2 = ["a","b","c","d"];
// 要素のindexを探索
console.log(arr2.indexOf("c"));
// 存在しない場合は-1を返す.
console.log(arr2.indexOf("e"));


const array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
// 単純イテレーション
for (const item of array) {
  if (item % 2 === 0) {
    console.log(item);
  }
}
// インデックスと一緒に巡回
array.forEach((item, i) => {
  if (item % 2 === 0) {
    console.log(`Index: ${i}, Value: ${item}`);
  }
});

//ソート
const sortedArray = array.sort((a,b) => a - b)
console.log(sortedArray);
const sortedArrayReversed = array.sort((a,b) => b - a)
console.log(sortedArrayReversed);

// アロー関数
const add = (a, b) => a + b;
console.log(add(8,9))

// 数字を文字列にする。
const num = 123;
const str = num.toString();

// 文字列が最後に特定のやつで終わるかどうか。
const num1 = 2020;
console.log(num1.toString().endsWith("20"));

// 配列を一つの文字列とする。
const arr1928 = [1,2,3,4];
console.log(arr1928.join(""));

// 文字列を配列に変更
const s1 = "1,2,3,4";
console.log(s1.split(",")) 

// 小文字大文字
const s2 = "abv";
console.log(s2.toLowerCase())
console.log(s2.toUpperCase())

//辞書を巡回
const obj = {"a": 1, "b": 2};
Object.entries(obj).forEach(([key, value]) => {
  console.log(`${key}: ${value}`);
});

//配列の最大値(スプレッド構文使うことに注意！)
const array2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
console.log(Math.max(...array2))

//オブジェクトがからかどうか
const obj3 = {};
console.log(Object.keys(obj3).length === 0)

// キーでソートして回す.
const obj344 = {"x": 4, "a": 1, "b": 2};
Object.keys(obj344).sort().forEach(key => {
  const value = obj344[key];
  console.log(`${key}: ${value}`);
});

//逆ソート
Object.keys(obj344).sort().reverse().forEach(key => {
  const value = obj344[key];
  console.log(`${key}: ${value}`);
});

//配列のSUM モダン 
const arr4 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
const sum = (arr4) => arr4.reduce((acc, current) => acc + current, 0);

//配列のフィルター
const arr5 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
console.log(arr5.filter(i => i % 2 === 0));

// 配列が空かどうか(=== [] では判定できない。)
const arr7 = [];
console.log(arr7.length === 0);

//三項演算子
const und = undefined;
const result1 = und ? "undefined!" : "T";
console.log(result1);

//二倍にして30以上だけ取り出す。
const numberssa = [10, 20, 30];
const result13 = numberssa
  .map(n => n * 2)
  .filter(n => n >= 30);

//配列から見つかった最初の要素のインデックスを返す
const arr21 = ["a", "b", "c", "b"];
console.log(arr21.findIndex(i => i === "b"));
console.log(arr21.indexOf("b"))
```
## SQLの基本構文

```SQL
--テーブル作成
CREATE TABLE users (
  user_id INTEGER PRIMARY KEY,
  email VARCHAR(255) UNIQUE,
  name VARCHAR(100),
  age INTEGER
);
-- データの挿入
INSERT INTO users (email, name, age)
VALUES('alice@example.com', 'Alice', 30);

--データの削除
DELETE FROM users WHERE email = 'eric01@example.com';

--データの更新
UPDATE users SET name = 'Tom', age = 29 WHERE user_id = 30;

--データの取り出し
SELECT * FROM users WHERE age > 10;
SELECT * FROM users WHERE NOT age > 10;
SELECT * FROM users WHERE name LIKE "JO%";
SELECT * FROM users WHERE age < 10 AND age > 30;

--ソートして取り出し
SELECT * FROM books ORDER BY published_year ASC;
--複数条件でソート
SELECT * FROM books ORDER BY price DESC, published_year ASC; 
```
