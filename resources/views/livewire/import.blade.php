<div class="mb-6">
    <div class="mb-4 flex justify-end">
        <form wire:submit.prevent="import" enctype="multipart/form-data" id="{{ $uploaded }}" class="flex flex-auto justify-between">
            @csrf
            <div
                x-data="{ isUploading: false, progress: 0 }"
                x-on:livewire-upload-start="isUploading = true"
                x-on:livewire-upload-finish="isUploading = false"
                x-on:livewire-upload-error="isUploading = false"
                x-on:livewire-upload-progress="progress = $event.detail.progress"
                class="grid"
            >
                <!-- File Input -->
                <input type="file" wire:model="file" class="@error('file') bg-red-700 @enderror">

                <!-- Progress Bar -->
                <div x-show="isUploading">
                    <div class="bg-blue-600 h-1.5 rounded-full dark:bg-blue-500" :style="`width: ${progress}%; transition: 3s;`"></div>
                </div>
            </div>
            @error('file')
                <span class="hidden mt-1 text-sm text-red" role="alert">{{ $message }}</span>
            @enderror

            <div wire:loading wire:target="photo">Uploading...</div>
            <button type="submit" class="inline-block align-middle text-center select-none border font-normal whitespace-no-wrap rounded py-1 px-3 leading-normal no-underline text-gray-600 border-gray-600 hover:bg-gray-600 hover:text-white bg-gray-100 hover:bg-gray-700">Import</button>
            @error('file')
                <span class="hidden mt-1 text-sm text-red" role="alert">{{ $message }}</span>
            @enderror
        </form>
    </div>
    @if ($isFileImporting)
        <div wire:poll="checkImportProgress">
            @if ($progress)
                {{ $progress['processedJobs'] }} out of {{ $progress['totalJobs'] }}
            @endif
            <div x-data="{ show: true }" x-show="show" class="w-full bg-gray-200 rounded-full h-1.5 mb-4 dark:bg-gray-700">
                <div class="bg-blue-600 h-1.5 rounded-full dark:bg-blue-500" style="width: {{ $progress ? intval(round($progress['progress'])) : 0 }}%"></div>
            </div>
        </div>
    @endif
    <table class="w-full max-w-full mb-4 bg-transparent">
        <thead>
            <tr>
                <th>Field Number</th>
                <th>Harvest Order</th>
                <th>Harvesters Used</th>
                <th>Pattern</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($harvest_managers as $harvest_manager)
                <tr>
                    <td class="text-center">{{ $harvest_manager->field_number }}</td>
                    <td class="text-center">{{ $harvest_manager->harvest_order }}</td>
                    <td class="text-center">{{ $harvest_manager->harvesters_used }}</td>
                    <td class="text-center">{{ $harvest_manager->pattern }}</td>
                    <td class="text-center">{{ $harvest_manager->location }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <div class="">
        {{ $harvest_managers->links() }}
    </div>
</div>
