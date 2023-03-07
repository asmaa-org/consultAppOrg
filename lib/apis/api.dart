
const String baseApi = "https://palmail.betweenltd.com/api";
const String loginApi = "$baseApi/login";
const String registerApi = "$baseApi/register";
const String updateUserApi = "$baseApi/user/update";
const String logoutApi = "$baseApi/logout";
const String usersApi = "$baseApi/users"; //all users + create users
const String getSingleUserApi = "$baseApi/users/{id}"; //get - update - delete
const String changePasswordUserApi = "$baseApi/users/{id}/password";
const changeRoleApi = "$baseApi/users/{id}/role";
const allMailsApi = "$baseApi/mails";
const allCategoriesApi = "$baseApi/categories"; //all + create
const singleCategoryApi = "$baseApi/categories/{id}";
const allStatusesApi = "$baseApi/statuses";
const singleStatusApi = "$baseApi/statuses/{id}?mail=false";

