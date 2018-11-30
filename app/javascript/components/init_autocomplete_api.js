const input_title = document.querySelector('#comic_title');
const input_isbn = document.querySelector('#comic_isbn');

const results = document.querySelector('.card-result-api-books');
const result_title = document.querySelector('#comic-title-result');
const result_author = document.querySelector('#comic-author-result');
const result_isbn = document.querySelector('#comic-isbn-result');
const result_artwork = document.querySelector('#comic-artwork-result');

const drawResponse = (data) => {
  result_title.innerHTML = '';
  result_author.innerHTML = '';
  result_isbn.innerHTML = '';
  result_artwork.innerHTML = '';

  const title = data.items[0].volumeInfo.title;
  const author = data.items[0].volumeInfo.authors[0];
  const isbn = data.items[0].volumeInfo.industryIdentifiers[0].identifier;
  const artwork = data.items[0].volumeInfo.imageLinks.smallThumbnail;

  displayResults();

  result_title.insertAdjacentHTML('beforeend',`<p> Titre: ${title}</p>`);
  result_author.insertAdjacentHTML('beforeend',`<p> Titre: ${author}</p>`);
  result_isbn.insertAdjacentHTML('beforeend',`<p> ISBN: ${isbn}</p>`);
  result_artwork.insertAdjacentHTML('beforeend',`<img src="${artwork}" alt="${title}">`);
};

const autocomplete = (event) => {
  const title_query = document.querySelector('#comic_title').value;
  const isbn_query = document.querySelector('#comic_isbn').value;
  const url_api = 'https://www.googleapis.com/books/v1/volumes?q=';
  const url = `${url_api}${title_query}+isbn:${isbn_query}&key=AIzaSyD_iYERhfu5IQpQiQljTgtw8xg3Da7JH5k`;
  fetch(url)
    .then(response => response.json())
    .then(data => drawResponse(data));
};

const displayResults = () => {
  if (input_title.value === "" && input_isbn.value === "") {
    results.style.display = "none";
  } else {
    results.style.display = "block";
  }
};

const autocompleteApiGoogleBooks = () => {
  input_title.addEventListener('keyup', autocomplete);
  input_isbn.addEventListener('keyup', autocomplete);
};


export { autocompleteApiGoogleBooks };
