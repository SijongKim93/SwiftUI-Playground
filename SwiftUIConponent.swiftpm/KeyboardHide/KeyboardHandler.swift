//
//  File.swift
//  
//
//  Created by 김시종 on 1/1/25.
//
import SwiftUI
import Combine

class KeyboardObserver: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0

    private var cancellables = Set<AnyCancellable>()

    init() {
        // 키보드가 올라올 때
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .merge(with: NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification))
            .sink { [weak self] notification in
                guard let userInfo = notification.userInfo else { return }
                // 키보드 끝 프레임(화면 좌표계 기준)
                if let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    // 화면 전체 높이에서 키보드 y 위치를 빼서 높이를 구하거나,
                    // 단순히 keyboardFrame.height가 키보드 높이가 됨
                    self?.keyboardHeight = keyboardFrame.height
                }
            }
            .store(in: &cancellables)

        // 키보드가 사라질 때
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .sink { [weak self] _ in
                self?.keyboardHeight = 0
            }
            .store(in: &cancellables)
    }
}
