
const baseApi = "https://palmail.betweenltd.com/api";
const loginApi = "$baseApi/login";
const registerApi = "$baseApi/register";
const updateUserApi = "$baseApi/user/update";
const logoutApi = "$baseApi/logout";
const usersApi = "$baseApi/users"; //all users + create users
const getSingleUserApi = "$baseApi/users/"; //get - update - delete
const changePasswordUserApi = "$baseApi/users/";
const changeRoleApi = "$baseApi/users/";
const mailsApi = "$baseApi/mails";  //create & all
const singleMailApi = "$baseApi/mails/"; // get single mail and update
const allCategoriesApi = "$baseApi/categories"; //all + create
const singleCategoryApi = "$baseApi/categories/";
const allStatusesApi = "$baseApi/statuses?mail=false";
const singleStatusApi = "$baseApi/statuses/{id}?mail=true"; //---------------------//
const attachmentApi = "$baseApi/attachments";
const rolesApi = "$baseApi/roles";
const searchApi = "$baseApi/search?text=";
const senderApi = "$baseApi/senders/";
const createSenderApi = "$baseApi/senders";
const tagsApi = "$baseApi/tags"; //all tags + create
const tagWithMailApi = "$baseApi/tags?tags=";
const tagOfMailApi = "$baseApi/mails/";




