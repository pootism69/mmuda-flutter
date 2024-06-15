const baseURL = 'http://localhost:8000/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const categoryURL = baseURL + '/category/{filter}';
const asalURL = baseURL + '/asal/{filter?}';
const yearURL = baseURL + '/year/{filter?}';
const userURL = baseURL + ' /user/{filter}';
const userResep = baseURL + '/userResep/{filter}';
const searchResep = baseURL + '/searchResep/{request?}';
const searchUser = baseURL + '/searchUser/{request?}';
const akunURL = baseURL + '/akun';
const editURL = baseURL + '/resep/{filter}/edit';
const deleteURL = baseURL + '/delete-resep/{filter}';
const buatResepURL = baseURL + '/post';
const infoResep = baseURL + '/resep/{filter}';
const GetUser = baseURL + '/user';

// apabila error

const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Akun sudah ada';
