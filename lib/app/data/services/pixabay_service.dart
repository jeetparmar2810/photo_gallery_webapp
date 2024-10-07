import '../../utils/export.dart';

// PixabayService class to handle API requests for fetching images from Pixabay
class PixabayService {
  // Function to fetch images from Pixabay API
  // - `page: the page number for pagination
  // - `query`: optional search query (default is 'mobile')
  Future<List<dynamic>> fetchImages(int page, {String query = 'mobile'}) async {
    try {
      // Get base URL and API key from environment variables

      final baseUrl = dotenv.env['BASE_URL']; // Access the base URL from env file
      final apiKey = dotenv.env['API_KEY'];   // Access the API key from env file

      if (baseUrl?.isNotEmpty == true && apiKey?.isNotEmpty == true) {
        final response = await get(Uri.parse(
          '$baseUrl?key=$apiKey&q=$query&image_type=photo&per_page=20&page=$page',
        ));

        if (response.statusCode == AppConstants.apiSuccessCode) {
          var data = json.decode(response.body);
          return data['hits'];
        } else {
          LoggerUtil.logError(
              '${AppConstants.failedToLoadImage}${AppConstants.statusCode}${response.statusCode}');
          throw Exception(AppConstants.failedToLoadImage);
        }
      } else {
        LoggerUtil.logError(AppConstants.failedToLoadImage);
        throw Exception(AppConstants.failedToLoadImage);
      }
    } catch (e) {
      LoggerUtil.logError("${AppConstants.imageFetchError} $e");
      return [];
    }
  }
}