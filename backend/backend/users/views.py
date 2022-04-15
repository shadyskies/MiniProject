from django.shortcuts import render, redirect
from .forms import LoginForm, SignupForm
from django.contrib.auth import login, logout, authenticate
from django.contrib import messages
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required


@login_required
def home(request):
	return render(request, 'users/home.html', {'user': request.user})


def login_view(request):
	if request.user.is_authenticated:
		return redirect("/")
	if request.method == "POST":
		form = AuthenticationForm(request, data=request.POST)
		if form.is_valid():
			username = form.cleaned_data.get('username')
			password = form.cleaned_data.get('password')
			user = authenticate(username=username, password=password)
			if user is not None:
				login(request, user)
				messages.info(request, f"You are now logged in as {username}.")
				return redirect("/")
			else:
				messages.error(request,"Invalid username or password.")
		else:
			messages.error(request,"Invalid username or password.")
	form = AuthenticationForm()
	return render(request=request, template_name="users/login.html", context={"form":form})

@login_required
def logout_view(request):
	logout(request)
	messages.info(request, "You have successfully logged out.") 
	return redirect("/login")

def signup(request):
	if request.user.is_authenticated:
		return redirect("/")
	if request.method == "POST":
		form = SignupForm(request.POST)
		if form.is_valid():
			user = form.save()
			messages.info(request, "User created successfully!")
			return redirect("/login/")
		else:
			messages.error(request, form.errors)
	form = SignupForm()
	return render (request=request, template_name="users/signup.html", context={"form":form})


# display the details of the logged in user
@login_required
def profile(request):
	context = {
		'first_name': request.user.first_name,
		'last_name': request.user.last_name,
		'email': request.user.email,
		'created_at': request.user.created_at,
		'updated_at': request.user.updated_at
	}
	return render(request, 'users/profile.html', context)
