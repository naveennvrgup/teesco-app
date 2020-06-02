// Common Errors
class NetworkError extends Error {}

class UnknownError extends Error {}

class InvalidInputError extends Error{
  final Map<String,String> details;

  InvalidInputError(this.details);
}

// Login Specific Errors
class InvalidCredentialsError extends Error {}

class UserNotFoundError extends Error {}

class ValidationError extends Error {
  final String description;

  ValidationError(this.description);
}
