package com.template.shared

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color

private val templateColorScheme = lightColorScheme(
    primary = Color(0xFF1B6EF3),
    secondary = Color(0xFF03DAC5),
    background = Color(0xFFF2F2F7),
    surface = Color(0xFFFFFFFF),
    onPrimary = Color.White,
    onSecondary = Color.Black,
    onBackground = Color(0xFF1F1F1F),
    onSurface = Color(0xFF1F1F1F)
)

@Composable
fun AppTheme(content: @Composable () -> Unit) {
    MaterialTheme(
        colorScheme = templateColorScheme,
        content = content
    )
}
