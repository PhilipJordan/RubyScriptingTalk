using CentralCommand.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CentralCommand.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult Index()
        {
            LoginViewModel viewModel = new LoginViewModel();

            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Index(LoginViewModel viewModel)
        {
            if (!IsValidUser(viewModel.UserName, viewModel.Password))
                ModelState.AddModelError("Mistakes were made", "Wrong Password or User Name given");

            if (ModelState.IsValid)
                return RedirectToAction("Staging", "Mission");

            return View(viewModel);
        }

        private bool IsValidUser(string userName, string password)
        {
            bool isValidUser = false;
            bool isValidPassword = false;

            if (!String.IsNullOrEmpty(userName))
                isValidUser = userName.ToLower().Equals("red");

            if (!String.IsNullOrEmpty(password))
                isValidPassword = password.Equals("Rover123");

            return isValidUser && isValidPassword;
        }
    }
}
