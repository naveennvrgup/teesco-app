// Common Errors
class NetworkError extends Error {}

class UnknownError extends Error {}

class InvalidFormInputError extends Error{
  final Map<String,String> errorDetail;

  InvalidFormInputError(this.errorDetail);
}

// Login Specific Errors
class InvalidCredentialsError extends Error {}

class UserNotFoundError extends Error {}

class ValidationError extends Error {
  final String description;

  ValidationError(this.description);
}
