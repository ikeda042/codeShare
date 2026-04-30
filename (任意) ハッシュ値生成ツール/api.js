async function fetchApi(text) {
  const url = `https://challenge-server.code-check.io/api/async/hash?q=${text}`;
  const response = await fetch(url);
  const body = await response.text();

  let result;
  try {
    result = JSON.parse(body);
  } catch {
    result = body;
  }

  if (response.status === 200) {
    return result;
  }

  throw result;
}

async function getHash(text) {

const hashSpan = document.getElementById("hashValue");

try {
  const result = await fetchApi(text);
  hashSpan.textContent = result;
  hashSpan.classList.add("success");
  hashSpan.classList.remove("error");
} catch (err) {
  hashSpan.textContent = err;
  hashSpan.classList.add("error");
  hashSpan.classList.remove("success");
}
}


// 以下はテスト用のコードです
if (typeof(exports) !== "undefined") {
    exports.fetchApi = fetchApi;
    exports.getHash = getHash;
}