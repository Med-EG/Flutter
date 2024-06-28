import cv2
import face_recognition
import pickle

def load_encodings(file_path):
    with open(file_path, 'rb') as file:
        encode_list_known_with_ids = pickle.load(file)
    return encode_list_known_with_ids

def recognize_faces(img):
    img = cv2.imread(img)
    encode_list_known, ids = load_encodings('EncodeFile.p')
    result = {"name": "Unknown"}

    img_s = cv2.resize(img, (0, 0), None, 0.25, 0.25)
    img_s = cv2.cvtColor(img_s, cv2.COLOR_BGR2RGB)
    faces_cur_frame = face_recognition.face_locations(img_s)
    encodes_cur_frame = face_recognition.face_encodings(img_s, faces_cur_frame)

    for encode_face, face_loc in zip(encodes_cur_frame, faces_cur_frame):
        matches = face_recognition.compare_faces(encode_list_known, encode_face)
        face_dis = face_recognition.face_distance(encode_list_known, encode_face)

        if True in matches:
            match_index = matches.index(True)
            result["name"] = ids[match_index]
            taken = True
            break
        else:
            result["name"] = "Unknown"
            taken = True
            break
    return result