
import cv2
import face_recognition
import pickle
import os
import numpy as np

def load_images_from_folder(folder):
    img_list = []
    ids = []
    for path in os.listdir(folder):
        img = cv2.imread(os.path.join(folder, path))
        face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)
        for (x, y, w, h) in faces:
            img = cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 255), 2)
        img_list.append(img)
        ids.append(os.path.splitext(path)[0])
    return img_list, ids

def find_encodings(images):
    encode_list = []
    for img in images:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        encodings = face_recognition.face_encodings(img)
        if encodings:
            encode_list.append(encodings[0])
    return encode_list

def generate_encodings(folder_path):
    img_list, ids = load_images_from_folder(folder_path)
    encode_list_known = find_encodings(img_list)
    encode_list_known_with_ids = [encode_list_known, ids]
    with open('EncodeFile.p', 'wb') as file:
        pickle.dump(encode_list_known_with_ids, file)
    
    # Convert numpy arrays to lists
    encode_list_known_with_ids[0] = [encoding.tolist() for encoding in encode_list_known_with_ids[0]]
    
    return encode_list_known_with_ids
