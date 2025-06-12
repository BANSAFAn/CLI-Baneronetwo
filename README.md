# CLI-Baneronetwo

[English](#english) | [Русский](#русский) | [Українська](#українська)

<a name="русский"></a>
## Русский

Простая кроссплатформенная CLI-команда для отображения ссылок на YouTube-канал и GitHub-профиль с цветным форматированием.

### Функционал

- Отображение ссылок на YouTube и GitHub
- Отображение имени пользователя из переменной окружения
- Цветной вывод и декоративные разделители
- Поддержка Windows, Linux и macOS

### Удаленный запуск (без скачивания)

#### Через GitHub Actions

Вы можете запустить CLI-команду напрямую через GitHub Actions без скачивания репозитория:

1. Перейдите на [страницу Actions репозитория](https://github.com/BANSAFAn/CLI-Baneronetwo/actions/workflows/run-cli.yml)
2. Нажмите "Run workflow"
3. Выберите формат вывода (text, json, markdown) из выпадающего списка
4. Нажмите "Run workflow"
5. После завершения выполнения, вы сможете увидеть результат в логах и скачать его как артефакт

#### Использование как GitHub Action

Вы также можете использовать Baneronetwo CLI как GitHub Action в своих workflow:

```yaml
steps:
  - name: Checkout repository
    uses: actions/checkout@v3

  - name: Run Baneronetwo CLI
    uses: BANSAFAn/CLI-Baneronetwo@main
    with:
      format: 'text'  # Опционально: text, json, markdown
      username: 'custom-user'  # Опционально: имя пользователя
```

Пример полного workflow можно найти в [.github/workflows/action-test.yml](https://github.com/BANSAFAn/CLI-Baneronetwo/blob/main/.github/workflows/action-test.yml)

#### Linux/macOS

```bash
curl -sSL https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.sh | bash
```

Для установки:

```bash
curl -sSL https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.sh | bash -s -- --install
```

#### Windows (PowerShell)

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.ps1')
```

Для установки:

```powershell
Invoke-Expression "& { $(Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.ps1')) -Install }"
```

### Установка из репозитория

#### Windows

##### Через PowerShell (рекомендуется)

1. Клонируйте репозиторий или скачайте ZIP-архив
2. Откройте PowerShell от имени администратора
3. Перейдите в директорию с проектом
4. Выполните:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   .\install.ps1
   ```
5. Перезапустите PowerShell
6. Теперь вы можете использовать команду `baneronetwo` из любой директории

##### Через командную строку

1. Клонируйте репозиторий или скачайте ZIP-архив
2. Откройте командную строку от имени администратора
3. Перейдите в директорию с проектом
4. Выполните:
   ```batch
   install.bat
   ```
5. Перезапустите командную строку
6. Теперь вы можете использовать команду `baneronetwo` из любой директории

#### Linux/macOS

1. Клонируйте репозиторий или скачайте ZIP-архив
2. Откройте терминал
3. Перейдите в директорию с проектом
4. Выполните:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
5. Теперь вы можете использовать команду `baneronetwo` из любой директории

### Использование

Просто введите `baneronetwo` в терминале или командной строке:

```
baneronetwo
```

### Лицензия

BSD 3-Clause License. См. файл [LICENSE](LICENSE) для получения дополнительной информации.

---

<a name="english"></a>
## English

A simple cross-platform CLI command to display links to YouTube channel and GitHub profile with colored formatting.

### Features

- Display links to YouTube and GitHub
- Display username from environment variable
- Colored output and decorative separators
- Support for Windows, Linux, and macOS

### Remote Execution (without downloading)

#### Via GitHub Actions

You can run the CLI command directly through GitHub Actions without downloading the repository:

1. Go to the [repository Actions page](https://github.com/BANSAFAn/CLI-Baneronetwo/actions/workflows/run-cli.yml)
2. Click "Run workflow"
3. Select the output format (text, json, markdown) from the dropdown list
4. Click "Run workflow"
5. After execution completes, you can see the result in the logs and download it as an artifact

#### Using as a GitHub Action

You can also use Baneronetwo CLI as a GitHub Action in your workflows:

```yaml
steps:
  - name: Checkout repository
    uses: actions/checkout@v3

  - name: Run Baneronetwo CLI
    uses: BANSAFAn/CLI-Baneronetwo@main
    with:
      format: 'text'  # Optional: text, json, markdown
      username: 'custom-user'  # Optional: username to display
```

A complete workflow example can be found in [.github/workflows/action-test.yml](https://github.com/BANSAFAn/CLI-Baneronetwo/blob/main/.github/workflows/action-test.yml)

#### Linux/macOS

```bash
curl -sSL https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.sh | bash
```

For installation:

```bash
curl -sSL https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.sh | bash -s -- --install
```

#### Windows (PowerShell)

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.ps1')
```

For installation:

```powershell
Invoke-Expression "& { $(Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.ps1')) -Install }"
```

### Installation from Repository

#### Windows

##### Via PowerShell (recommended)

1. Clone the repository or download the ZIP archive
2. Open PowerShell as administrator
3. Navigate to the project directory
4. Execute:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   .\install.ps1
   ```
5. Restart PowerShell
6. Now you can use the `baneronetwo` command from any directory

##### Via Command Prompt

1. Clone the repository or download the ZIP archive
2. Open Command Prompt as administrator
3. Navigate to the project directory
4. Execute:
   ```batch
   install.bat
   ```
5. Restart Command Prompt
6. Now you can use the `baneronetwo` command from any directory

#### Linux/macOS

1. Clone the repository or download the ZIP archive
2. Open terminal
3. Navigate to the project directory
4. Execute:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
5. Now you can use the `baneronetwo` command from any directory

### Usage

Simply type `baneronetwo` in the terminal or command prompt:

```
baneronetwo
```

### License

BSD 3-Clause License. See the [LICENSE](LICENSE) file for more information.

---

<a name="українська"></a>
## Українська

Проста кросплатформна CLI-команда для відображення посилань на YouTube-канал і GitHub-профіль з кольоровим форматуванням.

### Функціонал

- Відображення посилань на YouTube і GitHub
- Відображення імені користувача з змінної середовища
- Кольоровий вивід і декоративні роздільники
- Підтримка Windows, Linux і macOS

### Віддалений запуск (без завантаження)

#### Через GitHub Actions

Ви можете запустити CLI-команду безпосередньо через GitHub Actions без завантаження репозиторію:

1. Перейдіть на [сторінку Actions репозиторію](https://github.com/BANSAFAn/CLI-Baneronetwo/actions/workflows/run-cli.yml)
2. Натисніть "Run workflow"
3. Виберіть формат виводу (text, json, markdown) з випадаючого списку
4. Натисніть "Run workflow"
5. Після завершення виконання, ви зможете побачити результат у логах та завантажити його як артефакт

#### Використання як GitHub Action

Ви також можете використовувати Baneronetwo CLI як GitHub Action у своїх workflow:

```yaml
steps:
  - name: Checkout repository
    uses: actions/checkout@v3

  - name: Run Baneronetwo CLI
    uses: BANSAFAn/CLI-Baneronetwo@main
    with:
      format: 'text'  # Опціонально: text, json, markdown
      username: 'custom-user'  # Опціонально: ім'я користувача
```

Приклад повного workflow можна знайти в [.github/workflows/action-test.yml](https://github.com/BANSAFAn/CLI-Baneronetwo/blob/main/.github/workflows/action-test.yml)

#### Linux/macOS

```bash
curl -sSL https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.sh | bash
```

Для встановлення:

```bash
curl -sSL https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.sh | bash -s -- --install
```

#### Windows (PowerShell)

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.ps1')
```

Для встановлення:

```powershell
Invoke-Expression "& { $(Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BANSAFAn/CLI-Baneronetwo/main/remote_install.ps1')) -Install }"
```

### Встановлення з репозиторію

#### Windows

##### Через PowerShell (рекомендується)

1. Клонуйте репозиторій або завантажте ZIP-архів
2. Відкрийте PowerShell від імені адміністратора
3. Перейдіть до директорії з проектом
4. Виконайте:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   .\install.ps1
   ```
5. Перезапустіть PowerShell
6. Тепер ви можете використовувати команду `baneronetwo` з будь-якої директорії

##### Через командний рядок

1. Клонуйте репозиторій або завантажте ZIP-архів
2. Відкрийте командний рядок від імені адміністратора
3. Перейдіть до директорії з проектом
4. Виконайте:
   ```batch
   install.bat
   ```
5. Перезапустіть командний рядок
6. Тепер ви можете використовувати команду `baneronetwo` з будь-якої директорії

#### Linux/macOS

1. Клонуйте репозиторій або завантажте ZIP-архів
2. Відкрийте термінал
3. Перейдіть до директорії з проектом
4. Виконайте:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
5. Тепер ви можете використовувати команду `baneronetwo` з будь-якої директорії

### Використання

Просто введіть `baneronetwo` в терміналі або командному рядку:

```
baneronetwo
```

### Ліцензія

BSD 3-Clause License. Див. файл [LICENSE](LICENSE) для отримання додаткової інформації.