from flask import Flask, request, jsonify
from encode_generator import generate_encodings
from face_recognition_module import recognize_faces
import os
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
print("App Started")
os.environ['FLASK_ENV'] = 'production'  # Change 'development' to 'production' or 'testing'

os.environ['FLASK_DEBUG'] = '1'

UPLOAD_FOLDER = 'uploads'
app.secret_key = "secret key"
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)


# def ndarray_to_list(obj):
#     if isinstance(obj, np.ndarray):
#         return obj.tolist()
#     raise TypeError(f"Object of type {type(obj).__name__} is not JSON serializable")

# def generate_encodings(folder_path):
#     # Your existing code to generate encodings
#     encodings = []  # Example: replace this with your actual encodings generation logic
#     for file in os.listdir(folder_path):
#         if file.endswith(".jpg") or file.endswith(".png"):
#             image_path = os.path.join(folder_path, file)
#             # Your code to generate encoding for the image
#             # Example: encoding = some_encoding_function(image_path)
#             encoding = np.random.rand(128)  # Replace this with actual encoding logic
#             encodings.append(encoding.tolist())  # Convert ndarray to list

#     return encodings



@app.route('/generate-encodings', methods=['POST'])
def generate_encodings_route():
    folder_path = request.json.get('folder_path', 'Images')
    if not os.path.exists(folder_path):
        return jsonify({"error": "Folder not found"}), 404

    encodings = generate_encodings(folder_path)
    return jsonify({"status": "success", "encodings": encodings}), 200

@app.route('/', methods=['GET'])
def index():
    return jsonify({"status": "running"}), 200

@app.route('/recognize', methods=['POST'])
def recognize_route():
    if 'file' not in request.files:
        return jsonify({'message': 'No file part'}), 400
    file = request.files['file']
    if file.filename == '':
        return jsonify({'message': 'No selected file'}), 400
    if file:
        filename = file.filename
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        full_filename = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        result = recognize_faces(full_filename)
        if "error" in result:
            return jsonify(result), 500
        return jsonify(result), 200

if __name__ == '__main__':
    app.run(host='172.30.48.210', port=80, debug=True)