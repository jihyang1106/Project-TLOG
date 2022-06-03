const contents = document.querySelector(".contents");
let paraIndex = 1;

async function fetchLorem() {
  const response = await fetch(
    "https://baconipsum.com/api/?type=meat-and-filler&paras=18"
  );
  const data = await response.json();

  for (let i = 0; i < 6; i++) {
    const $tr = document.createElement("tr");
    $tr.innerHTML = `<td width='50' align='center'>${paraIndex++}</td>
                                    <td>${data[i * 3]}<br>${
      data[i * 3 + 1]
    }<br>${data[i * 3 + 2]}</td>`;
    contents.appendChild($tr);
  }
}

function debounce(callback, limit = 100) {
  let timeout;
  return function (...args) {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      callback.apply(this, args);
    }, limit);
  };
}

fetchLorem();

// ===== 무한 스크롤 (스크롤 이벤트) =====
document.addEventListener(
  "scroll",
  debounce((e) => {
    // clientHeight : 웹 브라우저 창의 높이
    // scrollTop : 현재 스크롤된 부분의 맨 위의 높이
    // scrollHeight : 문서의 총 높이 (= 스크롤의 총 높이)
    // 스크롤의 마지막에 도달 : clientHeight + scrollTop >= scrollHeight

    const { clientHeight, scrollTop, scrollHeight } = e.target.scrollingElement;
    console.dir(e.target);
    if (clientHeight + scrollTop >= scrollHeight) {
      fetchLorem();
    }
  }, 200)
);